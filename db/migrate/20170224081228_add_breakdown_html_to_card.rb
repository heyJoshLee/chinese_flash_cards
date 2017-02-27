class AddBreakdownHtmlToCard < ActiveRecord::Migration
  def change
    add_column :cards, :breakdown_html, :text
  end
end
