import carla
import random


client = carla.Client('localhost', 2000)
world = client.get_world()   # must add these two lines

client.load_world('Town05')


vehicle_blueprints = world.get_blueprint_library().filter('*vehicle*') #this is to addd the vehicles

spawn_points = world.get_map().get_spawn_points() #vehicel spawn points in carla
human_spawn_points = world.get_random_location_from_navigation()


for i in range(0, 50):
    world.try_spawn_actor(random.choice(vehicle_blueprints), random.choice(spawn_points))

ego_vehicle = world.spawn_actor(random.choice(vehicle_blueprints), random.choice(spawn_points))
