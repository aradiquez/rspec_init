module RspecInit
  module HtmlTable
    class Row

      CELL_TYPES = {
        thead: 'th',
        tbody: 'td',
        tfoot: 'td'
      }

      attr_reader :type, :data

      def initialize(type: 'tbody', data: [])
        @type = type
        @data = data
      end

      def to_s
        <<-HTML
          <#{type}>
            #{row}
          </#{type}>
        HTML
      end

      private

      def row
        row_content = ""
        data.each do |row|
          next row_content << cells(row) if row.kind_of?(Array)
          row_content << cell(row)
        end
        tr_row_content(row_content)
      end

      def cells(data)
        cells_content = ""
        data.each do |cell|
          cells_content << cell(cell)
        end
        tr_tag do
          cells_content
        end
      end

      def tr_row_content(content)
        return content if content.include?('tr')
        tr_tag do
          content
        end
      end

      def tr_tag(&block)
        <<-HTML
          <tr class="rspec_row">
            #{block.call}
          </tr>
        HTML
      end

      def cell(value)
        HtmlTable::Cell.new(type: CELL_TYPES[type.to_sym], data: value).to_s
      end

    end
  end
end