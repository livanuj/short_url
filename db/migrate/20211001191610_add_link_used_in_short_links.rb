class AddLinkUsedInShortLinks < ActiveRecord::Migration[6.1]
  def change
    add_column :short_links, :link_used, :integer, default: 0, comment: "track no of times short url used"
  end

  def data
    ShortLink.update_all(link_used: 0)
  end
end
