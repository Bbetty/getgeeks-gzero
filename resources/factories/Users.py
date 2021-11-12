
from faker import Faker
fake = Faker()


import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed
    

def factory_user():
    return {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email(),
        'password': fake.password()
    }

    
def factory_wrong_email():

    first_name = fake.first_name() 

    return {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': first_name + '#gmail.com',
        'password': fake.password()
    }


def factory_empty_fields():
    return {
        'name': ' ',
        'lastname': ' ',
        'email': ' ',
        'password': ' '
    }


def factory_login_user():
    return {
        'name': 'test',
        'lastname': 'loggin',    
        'email': 'testloggin@getgeeks.com',
        'password': 'test123'
    }


def factory_user_be_geek():
    return {
        'name': 'kim',
        'lastname': 'geek',    
        'email': 'kgeek@getgeeks.com',
        'password': 'test123'
    }