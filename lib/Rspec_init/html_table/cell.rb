module RspecInit
  module HtmlTable
    class Cell

      attr_reader :type, :data, :is_first, :is_last

      def initialize(type: 'td', data: {}, is_first: false, is_last: false)
        @type = type
        @data = data
        @is_first = is_first
        @is_last = is_last
      end

      def to_s
        data_from_db
        <<-HTML
          <#{type} class="rspec_cell #{is_first ? 'first_cell' : ''} #{is_last ? 'last_cell' : ''}"> #{data} </#{type}>
        HTML
      end

      private

      def data_from_db
        # mock - call to active record stuff
        MisteryModel.where({ this: 'that' })
      end
    end
  end
end
