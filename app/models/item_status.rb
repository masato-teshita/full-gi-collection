class ItemStatus < ActiveHash::Base
  self.data = [
      {id: 1, name: 'A', deinitionf: '新品・未使用'},
      {id: 2, name: 'B', deinitionf: '未使用に近い'},
      {id: 3, name: 'C', deinitionf: '目立った傷や汚れなし'},
      {id: 4, name: 'D', deinitionf: '傷や汚れあり'},
      {id: 5, name: 'E', deinitionf: '全体的に状態が悪い'},
  ]
end