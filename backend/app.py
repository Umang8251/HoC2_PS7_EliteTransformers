from flask import Flask, request, jsonify
import pandas as pd
import numpy as np
import joblib

app = Flask(__name__)

# Load the trained model
model = joblib.load("random_forest_model.pkl")

# Define the correct feature names used during training
FEATURE_NAMES = [
    "Age", "Systolic BP", "Diastolic", "BS", "Body Temp",
    "BMI", "Previous Complications", "Preexisting Diabetes",
    "Gestational Diabetes", "Mental Health", "Heart Rate"
]

@app.route("/predict", methods=["POST"])
def predict():
    try:
        # Get JSON data from request
        data = request.json
        print("Received Data:", data)
        
        # Standardize feature names to match model training
        standardized_data = {
            "Age": data.get("Age"),
            "Systolic BP": data.get("Systolic_BP"),
            "Diastolic": data.get("Diastolic_BP"),  # Fixed
            "BS": data.get("Blood_Sugar"),
            "Body Temp": data.get("Body_Temperature"),  # Fixed
            "BMI": data.get("BMI"),
            "Previous Complications": data.get("Previous_Complications"),
            "Preexisting Diabetes": data.get("Preexisting_Diabetes"),
            "Gestational Diabetes": data.get("Gestational_Diabetes"),
            "Mental Health": data.get("Mental_Health"),
            "Heart Rate": data.get("Heart_Rate"),
        }
        print("Standardized Data:", standardized_data)
        
        # Convert to DataFrame
        df = pd.DataFrame([standardized_data])
        print("Input DataFrame:\n", df)
        
        # Ensure feature order matches model training
        df = df[FEATURE_NAMES]
        print("Processed DataFrame before Prediction:\n", df)
        
        # Convert to NumPy array for prediction
        input_array = df.to_numpy()
        print("Final Input to Model (Array):\n", input_array)
        
        # Make prediction
        prediction = model.predict(input_array)
        print("Prediction:", prediction)
        
        return jsonify({"prediction": int(prediction[0])})
    
    except Exception as e:
        print("Error:", str(e))
        return jsonify({"error": str(e)})

if __name__ == "__main__":
    app.run(debug=True)
