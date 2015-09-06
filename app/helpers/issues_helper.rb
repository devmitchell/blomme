module IssuesHelper

  def options_for_priorities
    Issue::PRIORITY_LEVELS.map do |priority|
      [t("activerecord.attribute_values.issue.priority.#{priority}"), priority]
    end
  end

  def class_for_priority(priority:)
    case priority
    when 1
      'priority-1'
    when 2
      'priority-2'
    when 3
      'priority-3'
    when 4
      'priority-4'
    when 5
      'priority-5'
    when 6
      'priority-brandon'
    else
      ''
    end
  end

end
