ThinkingSphinx::Index.define :reading_list, :with => :active_record do
  indexes reading_list.title
end