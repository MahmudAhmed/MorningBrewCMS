class Story < ApplicationRecord
  validates :body, presence: true
  validates :title, presence: true, uniqueness: true
  validate :tag_is_1_word

  def date
    date = self.created_at
    date.strftime("%B %d, %Y")
  end

  def set_css 
    roadie_doc = Roadie::Document.new(self.body)
    roadie_doc.add_css(Story.get_css)
    self.body = roadie_doc.transform_partial
  end

  def self.get_css 
    "table {
      border-collapse: collapse;
      table-layout: fixed;
      margin: 0 auto;
    }

    .p_btn-social a {
      border: none;
    }

    table table table {
      table-layout: auto;
    }

    .container {
      width: 100%;
      max-width: 585px;
      margin: 0 auto;
    }

    .section {
      padding-top: 5px;
      padding-right: 20px;
      padding-left: 20px;
      text-align: left;
    }

    h1 {
      font-family: Helvetica, Arial, sans-serif;
      font-size: 22px;
      font-weight: 600;
      color: #000000;
      margin-bottom: 15px;
      margin-top: 5px !important;
    }

    h2 {
      font-family: Helvetica, Arial, sans-serif;
      font-size: 18px;
      font-weight: 700;
      color: #000000;
      margin: 0;
    }

    h3 {
      font-family: Helvetica, Arial, sans-serif;
      font-size: 26px;
      color: #000000;
      font-weight: 200;
      letter-spacing: 2px;
      margin: 0;
      padding: 0;
    }

    h3 span {
      font-weight: 800;
      color: #005ab6;
    }

    h4 {
      font-family: Helvetica, Arial, sans-serif;
      font-size: 18px !important;
      color: #005ab6;
      font-weight: bold;
      margin-top: 0;
      margin-bottom: 0;
    }

    .body-copy {
      font-family: Helvetica, Arial, sans-serif;
      font-size: 16px;
      color: #252525;
    }

    .body-copy p {
      margin-top: 15px;
      margin-bottom: 15px;
      line-height: 22px;
    }

    .body-copy li {
      margin-top: 8px;
      margin-bottom: 8px;
      line-height: 22px;
    }

    .link {
      border-bottom: 2px solid #005ab6;
      text-decoration: none;
      color: #252525;
    }

    a {
      border-bottom: 2px solid #005ab6;
      text-decoration: none;
      color: #252525;
    }

    .link-blue {
      color: #005ab6;
      text-decoration: none;
      font-weight: bold;
    }

    .divider {
      font-size: 1px;
      margin-top: 8px;
      margin-bottom: 8px;
    }

    .ticker-border {
      padding: 8px;
      border-bottom: 2px solid #cccccc;
    }

    .tag-outer {
      padding-bottom: 10px;
    }

    .tag-inner {
      font-family: Helvetica, Arial, sans-serif;
      font-size: 15px;
      font-weight: bold;
      color: #252525;
      background-color: #f0b041;
      padding: 3px 10px;
    }

    .tag-inner-sponsored {
      font-family: Helvetica, Arial, sans-serif;
      font-size: 15px;
      font-weight: bold;
      color: #252525;
      background-color: #005ab6;
      padding: 3px 10px;
    }

    .header {
      font-family: Helvetica, Arial, sans-serif;
      font-size: 13px;
      color: #252525;
      padding-top: 0;
      padding-bottom: 30px;
    }

    .logo-margin {
      margin-top: 30px;
      margin-bottom: 20px;
    }

    .sponsor {
      font-family: Helvetica, Arial, sans-serif;
      font-size: 13px;
      color: #252525;
      padding-right: 8px;
    }

    .sponsor-2 {
      font-family: Helvetica, Arial, sans-serif;
      font-size: 13px;
      color: #252525;
      font-weight: bold;
      padding-right: 8px;
    }

    .p-first {
      margin-top: 25px;
    }

    .p-last {
      margin-bottom: 25px;
    }

    .p-quote {
      font-style: italic;
    }

    .btn-white {
      display: inline-block;
      font-family: Helvetica, Arial, sans-serif;
      font-size: 15px;
      color: #005ab6;
      font-weight: bold;
      text-decoration: none;
      padding: 8px;
      border: 2px solid #005ab6;
    }

    .btn-blue-ctn {
      display: inline-block;
      background-color: #005ab6;
      padding: 4px;
    }

    .btn-blue {
      display: inline-block;
      font-family: Helvetica, Arial, sans-serif;
      font-size: 15px;
      color: #ffffff;
      background-color: #005ab6;
      font-weight: bold;
      text-decoration: none;
      padding: 4px 18px;
      border: 2px solid #ffffff;
    }

    .block-link {
      color: #005ab6;
      font-weight: bold;
      text-decoration: underline;
    }

    .col-2-1 {
      width: 75px;
    }

    .col-2-2 {
      padding-left: 25px;
      vertical-align: middle;
    }

    .p_btn-social {
      margin-top: 25px;
      margin-bottom: 0;
    }

    .bold {
      font-weight: bold;
      color: #000000;
    }

    strong {
      color: #000000;
    }

    .col-3-1 {
      width: 53px;
      padding-right: 25px;
    }

    .col-3-2 {
      width: 154px;
      font-family: Helvetica, Arial, sans-serif;
      font-size: 22px;
      color: #252525;
      font-weight: bold;
      text-align: left;
    }

    .col-3-3 {
      text-align: left;
      font-weight: normal;
    }

    .col-3-3 p {
      margin-top: 0;
    }

    .stb-header {
      font-family: Arial, Helvetica, sans-serif;
      font-size: 18px;
      color: #ffffff;
      font-weight: 600;
      text-align: center;
    }

    .stb-ref-count {
      font-family: Arial, sans-serif;
      font-size: 18px;
      color: #005ab6;
      background-color: #ffffff;
      border-radius: 100%;
      width: 50px;
      height: 50px;
      text-align: center;
    }

    .center {
      margin: 0 auto;
      text-align: center;
    }

    .stb-btn {
      width: 100%;
      max-width: 150px;
      font-family: Helvetica, Arial, sans-serif;
      font-size: 16px;
      color: #ffffff;
      font-weight: 900;
      text-decoration: none;
      text-align: center;
      background-color: #005ab6;
      padding: 15px;
      border-radius: 4px;
      display: block;
      margin: 0 auto;
    }

    .social-banner-ctn {
      padding: 15px;
      text-align: center;
      border-top: 15px solid #ffffff;
    }"
  end

  private

  def tag_is_1_word
    if tag.to_s.squish.split.size != 1
      errors.add(:tag, "must be one word.")
    end
  end
  

end 