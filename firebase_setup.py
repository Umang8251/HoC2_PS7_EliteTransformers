import firebase_admin
from firebase_admin import credentials, firestore

# Load service account key
cred = credentials.Certificate("heal-o-code-firebase-adminsdk-fbsvc-8ca04411d7.json")
firebase_admin.initialize_app(cred)

# Connect to Firestore
db = firestore.client()

print("Firebase Firestore connected successfully!")
