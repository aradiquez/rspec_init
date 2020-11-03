module RspecInit
  class Main
    attr_accessor :content, :renderer

    TEMPLATE_FILE_NAME = File.expand_path('lib/template.html.erb')
    OUTPUT_FILE = 'table.html'.freeze

    def initialize(content)
      @content = html_table(content).to_html
      loaded_template = File.read(TEMPLATE_FILE_NAME)
      @renderer = ERB.new(loaded_template)
    end

    def to_html
      File.open(OUTPUT_FILE, 'w') do |f|
        f.write renderer.result(binding)
      end
    end

    private

    def html_table(content)
      RspecInit::HtmlTable::Table.new(data: content)
    end
  end
end
