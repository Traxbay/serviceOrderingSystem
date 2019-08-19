module BasicPagesHelper

  def linkedin
    return 'https://www.linkedin.com/in/abdullahfaraj'
  end

  def github
    return 'https://www.github.com/Traxbay'
  end

  def alyamamah
    return 'https://yu.edu.sa/'
  end

  def twitter
    return 'https://www.twitter.com/Trxby'
  end
  
  def full_title(page_title = "")
    base_title = "Service Ordering System"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
