module ApplicationHelper
  def default_meta_tags
    {
      site: 'full-gi-collection',
      title: '古コレ',
      reverse: true,
      charset: 'utf-8',
      description: '古着屋選びで失敗したくない人のためのサイト「古コレ」は東京都内にある古着屋情報を掲載中。ユーザーの口コミや、様々な条件で目的の古着屋を検索できます！さあ、今すぐ口コミを投稿してみよう！！',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: '/assets/facicon.ico',
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@masato_teshita',
      }
    }
  end
end
