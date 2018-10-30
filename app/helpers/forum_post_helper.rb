module ForumPostHelper
  def render_post(string)
    to_return = []

    unprossesed = string.split('https')
    unprossesed.each_with_index do |s, i|
      if i.zero?
        to_return << s
      elsif
        to_return << parse_adrress(s)
      end
    end

    to_return.join('https')
  end

  def parse_adrress(string)
    to_return = []
    split_by_question = string.split('?')
    split_by_question.each_with_index do |s, i|
      if i.zero?
        to_return << s
      else
        to_return << next_parse(s)
      end
    end
    to_return.join(' ')
  end

  def next_parse(string)
    to_return = []

    split_by_quote = string.split('&quot;')
    split_by_quote.each_with_index do |s, i|
      if s.include?('AWS')
        to_return << parse_outer_html(s)
      else
        to_return << s
      end
    end
    to_return.join('&quot')
  end

  def parse_outer_html(string)
    array = []

    string.split('"').each do |s|
      unless s.include?('aws')
        array << s
      end
    end
    array.join('"')
  end
end
