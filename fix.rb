def render_text
  string = '<div><figure data-trix-attachment="{&quot;contentType&quot;:&quot;image/jpeg&quot;,&quot;filename&quot;:&quot;IMG-20180913-WA0003.jpg&quot;,&quot;filesize&quot;:31409,&quot;height&quot;:520,&quot;href&quot;:&quot;https://sprout-free.s3.amazonaws.com/store/c0082ad735659007df9589ae0fd58e99.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIAIPHFUXBCGUMWT3DQ%2F20181029%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date=20181029T232628Z&amp;X-Amz-Expires=900&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=6f8f6a4fe69806e34fa8363d1172c1fee1bd34e4c10414bef21164d49a1392a4&quot;,&quot;url&quot;:&quot;https://sprout-free.s3.amazonaws.com/store/c0082ad735659007df9589ae0fd58e99.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIAIPHFUXBCGUMWT3DQ%2F20181029%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date=20181029T232628Z&amp;X-Amz-Expires=900&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=6f8f6a4fe69806e34fa8363d1172c1fee1bd34e4c10414bef21164d49a1392a4&quot;,&quot;width&quot;:1040}" data-trix-content-type="image/jpeg" data-trix-attributes="{&quot;presentation&quot;:&quot;gallery&quot;}" class="attachment attachment--preview attachment--jpg"><a href="https://sprout-free.s3.amazonaws.com/store/c0082ad735659007df9589ae0fd58e99.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIAIPHFUXBCGUMWT3DQ%2F20181029%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date=20181029T232628Z&amp;X-Amz-Expires=900&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=6f8f6a4fe69806e34fa8363d1172c1fee1bd34e4c10414bef21164d49a1392a4"><img src="https://sprout-free.s3.amazonaws.com/store/c0082ad735659007df9589ae0fd58e99.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIAIPHFUXBCGUMWT3DQ%2F20181029%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date=20181029T232628Z&amp;X-Amz-Expires=900&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=6f8f6a4fe69806e34fa8363d1172c1fee1bd34e4c10414bef21164d49a1392a4" width="1040" height="520"><figcaption class="attachment__caption"></figcaption></a></figure></div>'

  parse_string(string)
end

def parse_string(string)
  to_return = []

  unprossesed = string.split('https')
  unprossesed.each_with_index do |s, i|
    if i.zero?
      to_return << s
    elsif
      to_return << parse_adrress(s)
    end
  end

  p to_return.join('https')
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


render_text
