module NavPillHelper
  def get_pill(text, link, li_id:nil, a_id:nil, a_class:nil, li_class:nil, onclick: nil)
    li_attr = {}
    li_attr[:id] = li_id
    li_attr[:class] = li_class

    a_attr = {}
    a_attr[:id] = a_id
    a_attr[:class] = ['chesspill']
    a_attr[:class] << a_class
    a_attr[:href] = link
    a_attr[:onclick] = onclick

    content_tag(:li, li_attr) do
      content_tag(:a, a_attr) do
        content_tag(:strong) do
          text
        end
      end
    end
  end
end
