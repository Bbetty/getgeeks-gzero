
import bcrypt
from faker import Faker
fake = Faker()

first_name = fake.first_name()

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed


def factory_user(target):

    try:

        data = {
            'faker': {
                'name': fake.first_name(),
                'lastname': fake.last_name(),
                'email': fake.free_email(),
                'password': fake.password()
            },
            'login':{
                'name': 'test',
                'lastname': 'loggin',
                'email': 'testloggin@getgeeks.com',
                'password': 'test123'
            },
            'wrong_email': {
                'name': fake.first_name(),
                'lastname': fake.last_name(),
                'email': first_name + '#gmail.com',
                'password': fake.password()
            },
            'be_geek': {
                'name': 'kim',
                'lastname': 'geek',
                'email': 'kgeek@getgeeks.com',
                'password': 'test321',
                    'geek_profile': {
                        'whats': '81.98987-4220',
                        'desc': 'Computador lento? Demora para Inicializar? Tela azul? Temos a solução para seu computador, notebook, mesa digitalizadora e impressoras.',
                        'printer_repair': 'sim',
                        'work': 'Remoto',
                        'cost': '50'
                        }
                }
            }
        return data[target]
    except:
        print('ERROR TEST DATA :(')
        raise

