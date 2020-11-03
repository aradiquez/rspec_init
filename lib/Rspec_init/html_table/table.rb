module RspecInit
  module HtmlTable
    class Table

      ROW_TYPE = OpenStruct.new(
        header: 'thead',
        body: 'tbody',
        footer: 'tfoot'
      )

      attr_reader :data

      def initialize(data: [])
        @data = data
      end

      def to_html
        <<-HTML
          <table class="rspec_table">
            #{header}
            #{rows}
            #{footer}
          </table>
        HTML
      end

      private

      def header
        HtmlTable::Row.new(type: ROW_TYPE.header, data: data.header).to_s
      end

      def rows
        HtmlTable::Row.new(type: ROW_TYPE.body, data: data.body).to_s
      end

      def footer
        HtmlTable::Row.new(type: ROW_TYPE.footer, data: data.footer).to_s
      end

    end
  end
end
