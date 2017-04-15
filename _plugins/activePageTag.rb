module Cusa
  class ActivePageTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      name = context.environments.first["page"]["active"]
      return '' if name.nil? or @text.nil?
      return name == @text ? ' active ' : ''
    end
  end
end

Liquid::Template.register_tag('active_page', Cusa::ActivePageTag)
