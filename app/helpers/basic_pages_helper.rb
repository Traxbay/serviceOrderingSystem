module BasicPagesHelper

  def full_title(page_title = "")
    base_title = "Service Ordering System"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
