class RankingController < ApplicationController
  def have
    @have_ranking_items = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id)
  end
  
  def want
    @want_ranking_items = Want.group(:item_id).order('count_item_id desc').limit(10).count(:item_id)
  end
end
