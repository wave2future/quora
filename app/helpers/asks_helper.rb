require "bluecloth"
module AsksHelper
  def topics_name_tag(topics,limit = 3)
    html = []
    return "" if topics.blank?
    if limit > 0
      topics = topics[0,limit]
    end
    for topic in topics
      html.append("<a class=\"topic\" href=\"/topic/#{topic.id}\">#{topic.name}</a>")
    end
    return raw html.join(",")
  end

  def md_body(str)
    return raw str
  end

  def truncate_lines(body, lines = 4, max_chars = 400)
    return "" if body.blank?
    body_lines = body.strip("\n")
    lines = body_lines.count if body_lines.count < lines
    summary = body_lines[0,lines].join("\n")
    summary = inner_truncate_lines(body_lines, lines - 1, summary, max_chars)
    return summary
  end

  private
  def inner_truncate_lines(body_lines, lines, summary, max_chars)
    if summary.length > max_chars
      lines -= 1
      if lines > 1
        body_lines = body_lines[0,lines]
        summary = body_lines.join("\n")
        return inner_truncate_lines(body_lines, lines, summary, max_chars)
      else
        summary = body_lines[0][0,max_chars]
        return summary
      end
    else
      return summary
    end
  end

  
end