class ItemStatus < ActiveHash::Base
  self.data = [
      {id: 1, name: 'A', definition: '新品・未使用'},
      {id: 2, name: 'B', definition: '未使用に近い'},
      {id: 3, name: 'C', definition: '目立った傷や汚れなし'},
      {id: 4, name: 'D', definition: '傷や汚れあり'},
      {id: 5, name: 'E', definition: '全体的に状態が悪い'},
  ]
end