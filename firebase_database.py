import firebase_admin
from firebase_admin import credentials, firestore
from datetime import datetime , timezone

# Initialize Firebase
cred = credentials.Certificate("heal-o-code-firebase-adminsdk-fbsvc-8ca04411d7.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

# Dummy Data
users = [
    {"user_id": "user123", "name": "Alice", "age": 28, "phone": "+1234567890",
     "location": "Rural Area 1", "language_preference": "Kannada",
     "pregnancy_status": "Trimester 2", "emergency_contact": "+9876543210"},
    
    {"user_id": "user456", "name": "Emma", "age": 30, "phone": "+2233445560",
     "location": "Urban Area", "language_preference": "Spanish",
     "pregnancy_status": "Trimester 1", "emergency_contact": "+9998887770"}
]

# Add users to Firestore
for user in users:
    db.collection("Users").document(user["user_id"]).set(user)

# Pregnancy Health Monitoring Data
pregnancy_health = {
    "record_id": 1,
    "user_id": "user123",
    "date": datetime(2025, 3, 28),
    "age": 28,
    "systolic_bp": 120,
    "diastolic_bp": 80,
    "blood_sugar": 90.5,
    "body_temp": 98.6,
    "bmi": 24.5,
    "previous_conditions": "None",
    "preexisting_conditions": "Hypertension",
    "gestational_age": 20,
    "mental_health_status": "Stable",
    "heart_rate": 75,
    "risk_level": "Low"
}

db.collection("PregnancyHealthMonitoring").document(str(pregnancy_health["record_id"])).set(pregnancy_health)

# Pregnancy Tracking Table
pregnancy_tracking = {
    "tracking_id": 1,
    "user_id": "user123",
    "week_number": 20,
    "symptoms_logged": "Fatigue, Nausea",
    "weight": 65.5,
    "BP_reading": "120/80",
    "notes": "Feeling tired but normal",
    "reminder_status": True
}

db.collection("PregnancyTracking").document(str(pregnancy_tracking["tracking_id"])).set(pregnancy_tracking)

# Healthcare Providers Table
healthcare_provider = {
    "provider_id": 1,
    "name": "Dr. Smith",
    "specialization": "Obstetrician",
    "hospital_name": "City Hospital",
    "location": "Downtown",
    "contact_number": "+111222333",
    "availability_status": "Available"
}

db.collection("HealthcareProviders").document(str(healthcare_provider["provider_id"])).set(healthcare_provider)

# SOS Requests Table
sos_request = {
    "sos_id": 1,
    "user_id": "user123",
    "timestamp": datetime.now(timezone.utc),
    "location_coordinates": "40.7128° N, 74.0060° W",
    "nearest_hospital_id": 1,
    "status": "Pending"
}

db.collection("SOSRequests").document(str(sos_request["sos_id"])).set(sos_request)

# Educational Resources Table
educational_resource = {
    "resource_id": 1,
    "title": "Prenatal Nutrition Guide",
    "category": "Nutrition",
    "language": "English",
    "content_url": "https://medlineplus.gov/pregnancyandnutrition.html#:~:text=You%20need%20more%20folic%20acid,from%20foods%20and%2For%20vitamins.",
    "offline_accessible": True
}

db.collection("EducationalResources").document(str(educational_resource["resource_id"])).set(educational_resource)

# Telemedicine Appointments Table
telemedicine_appointment = {
    "appointment_id": 1,
    "user_id": "user123",
    "provider_id": 1,
    "appointment_time": datetime(2025, 3, 30, 10, 0),
    "status": "Scheduled"
}

db.collection("TelemedicineAppointments").document(str(telemedicine_appointment["appointment_id"])).set(telemedicine_appointment)



#db.collection("Notifications").document(str(notification["notification_id"])).set(notification)

print("All data added successfully!")



