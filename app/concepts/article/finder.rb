class Article::Finder < Trailblazer::Finder
  features Sorting, Paging

  entity_type { Article }
  adapters ActiveRecord

  per_page 10

  filter_by :is_pickup, with: :apply_pickup_filter
  sortable_by :created_at

  private

  def apply_pickup_filter(entity_type, value)
    return if value.blank?

    entity_type.where(is_pickup: value)
  end
end
