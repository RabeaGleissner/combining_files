require "program"

describe Program do
  it "combines files and returns JSON" do
    output = Program.run("json")

    # rubocop:disable Layout/LineLength
    expect(output[0...200]).to eq('[{"doi":"10.1234/altmetric0","article_title":"Small Wooden Chair","issn":"1337-8688","author_name":"","journal_title":"Shanahan, Green and Ziemann"},{"doi":"10.1234/altmetric100","article_title":"Ergo')
    # rubocop:enable Layout/LineLength
  end

  it "combines files and returns CSV" do
    output = Program.run("csv")

    expect(output[0...200]).to eq('DOI,Article title,Journal ISSN,Author name,Journal title
10.1234/altmetric0,Small Wooden Chair,1337-8688,"","Shanahan, Green and Ziemann"
10.1234/altmetric100,Ergonomic Rubber Shirt,2542-5856,"","Wilk')
  end
end
