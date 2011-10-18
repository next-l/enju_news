module ExpireEditableFragment
  def expire_editable_fragment(record, fragments = [], formats = [])
    fragments.uniq!
    fragments = ['detail'] if fragments.empty?
    if record
      I18n.available_locales.each do |locale|
        Role.all_cache.each do |role|
          fragments.each do |fragment|
            expire_fragment(:controller => record.class.to_s.pluralize.downcase, :action => :show, :id => record.id, :page => fragment, :role => role.name, :locale => locale)
          end
        end
      end
    end
  end
end
