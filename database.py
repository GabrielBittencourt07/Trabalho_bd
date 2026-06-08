import  psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

def connect():
    try:
        connection = psycopg2.connect(
            host=os.getenv("DB_HOST"),
            database=os.getenv("DB_NAME"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD")
        )
        return connection
    
    except Exception as e:
        print(f"Error connecting to the database: {e}")
        return None
    

def disconnect(connection):
    if connection:
        connection.close()
        



