# ゲストユーザーのサンプルデータ
guest = User.find_or_create_by!(email: 'guest@example.com') do |user|
  user.password = SecureRandom.urlsafe_base64
  user.guest = true
end

restaurants_data = [
  { name: '銀座 鮨さいとう', genre: '寿司', rating: 5, comment: '人生で一番美味しい寿司。シャリの温度と魚の鮮度が完璧。', visited_at: '2026-01-15', tags: 'ディナー 記念日 高級' },
  { name: 'ラーメン二郎 三田本店', genre: 'ラーメン', rating: 4, comment: 'ボリューム満点。ニンニクマシマシで。', visited_at: '2026-02-03', tags: 'ランチ がっつり' },
  { name: 'bills 表参道', genre: 'カフェ', rating: 4, comment: 'リコッタパンケーキが絶品。週末は並ぶので早めに。', visited_at: '2026-02-20', tags: 'ブランチ カフェ おすすめ' },
  { name: '焼肉 叙々苑', genre: '焼肉', rating: 5, comment: '特上カルビが最高。タレが絶妙。', visited_at: '2026-01-28', tags: 'ディナー 記念日 肉' },
  { name: 'サルヴァトーレ クオモ', genre: 'イタリアン', rating: 3, comment: 'ピザの生地がもちもち。コスパは良い。', visited_at: '2026-03-01', tags: 'ランチ イタリアン' },
]

restaurants_data.each do |data|
  tags = data.delete(:tags)
  restaurant = guest.restaurants.find_or_create_by!(name: data[:name]) do |r|
    r.assign_attributes(data)
  end
  restaurant.tag_names = tags
  restaurant.save!
end

puts "シードデータ投入完了！"