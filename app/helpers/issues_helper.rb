module IssuesHelper
  
  def class_for_priority(priority:)
    case priority
    when Issue::PRIORITY_1
      'priority-1'
    when Issue::PRIORITY_2
      'priority-2'
    when Issue::PRIORITY_3
      'priority-3'
    when Issue::PRIORITY_4
      'priority-4'
    when Issue::PRIORITY_5
      'priority-5'
    when Issue::PRIORITY_BRANDON
      'priority-brandon'
    else
      ''
    end
  end
  
end
