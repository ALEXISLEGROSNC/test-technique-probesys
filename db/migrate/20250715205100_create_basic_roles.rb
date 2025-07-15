class CreateBasicRoles < ActiveRecord::Migration[8.0]
  def up
    Role.create(name: 'Heal')
    Role.create(name: 'Tank')
    Role.create(name: 'DPS')
  end

  def down # si on fait un rollback , on supprimme les rôles créés
    Role.where(name: ['Heal', 'Tank', 'DPS']).destroy_all
  end
end
