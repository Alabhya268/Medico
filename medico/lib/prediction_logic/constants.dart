const symptomsToLabel = {
  'nan': 0,
  'Itching': 1,
  'Skin Rash': 2,
  'Continuous Sneezing': 3,
  'Shivering': 4,
  'Stomach Pain': 5,
  'Acidity': 6,
  'Vomiting': 7,
  'Indigestion': 8,
  'Muscle wasting': 9,
  'Patches in throat': 10,
  'Fatigue': 11,
  'Weight Loss': 12,
  'Sunken Eyes': 13,
  'Cough': 14,
  'Headache': 15,
  'Chest Pain': 16,
  'Back Pain': 17,
  'Weakness in Limbs': 18,
  'Chills': 19,
  'Joint Pain': 20,
  'Yellowish Skin': 21,
  'Constipation': 22,
  'Pain During Bowel Movements': 23,
  'Breathlessness': 24,
  'Cramps': 25,
  'Weight Gain': 26,
  'Mood Swings': 27,
  'Neck Pain': 28,
  'Muscle Weakness': 29,
  'Stiffneck': 30,
  'Pus Filled Pimples': 31,
  'Burning Micturition': 32,
  'Bladder Discomfort': 33,
  'High Fever': 34,
  'Nodal Skin Eruptions': 35,
  'Ulcers On Tongue': 36,
  'Loss Of Appetite': 37,
  'Restlessness': 38,
  'Dehydration': 39,
  'Dizziness': 40,
  'Weakness of one body side': 41,
  'Lethargy': 42,
  'Nausea': 43,
  'Abdominal pain': 44,
  'Pain in Anal Region': 45,
  'Sweating': 46,
  'Bruising': 47,
  'Cold hands and feets': 48,
  'Anxiety': 49,
  'Knee pain': 50,
  'Swelling Joints': 51,
  'Blackheads': 52,
  'Foul smell of urine': 53,
  'skin Peeling': 54,
  'Blister': 55,
  'Dischromic Patches': 56,
  'Watering from Eyes': 57,
  'Extra marital contacts': 58,
  'Diarrhoea': 59,
  'Loss of balance': 60,
  'Blurred and Distorted Vision': 61,
  'Altered sensorium': 62,
  'Dark Urine': 63,
  'Swelling of stomach': 64,
  'Bloody stool': 65,
  'Obesity': 66,
  'Hip joint pain': 67,
  'Movement stiffness': 68,
  'Spinning movements': 69,
  'Scurring': 70,
  'Continuous feel of urine': 71,
  'Silver like dusting': 72,
  'Red sore around nose': 73,
  'Spotting urination': 75,
  'Passage of gases': 76,
  'Irregular sugar level': 77,
  'Family history': 78,
  'Lack of concentration': 79,
  'Excessive hunger': 80,
  'Yellowing of eyes': 81,
  'Distention of abdomen': 82,
  'Irritation in rectum': 83,
  'Swollen Legs': 84,
  'Painful walking': 85,
  'Small dents in nails': 86,
  'Yellow crust ooze': 87,
  'Internal itching': 88,
  'Mucoid Sputum': 89,
  'History of alcohol consumption': 90,
  'Swollen blood vessels': 91,
  'Unsteadiness': 92,
  'Inflammatory Nails': 93,
  'Depression': 94,
  'Fluid Overload': 95,
  'Swelled lymph nodes': 96,
  'Malaise': 97,
  'Prominent veins on calf': 98,
  'Puffy face and eyes': 99,
  'Fast heart rate': 100,
  'Irritability': 101,
  'Muscle pain': 102,
  'Mild fever': 103,
  'Yellow urine': 104,
  'Phlegm': 105,
  'Enlarged thyroid': 106,
  'Increased appetite': 107,
  'Visual disturbances': 108,
  'Brittle nails': 109,
  'Drying and Tingling lips': 110,
  'Polyuria': 111,
  'Pain behind the eyes': 112,
  'Toxic look (typhos)': 113,
  'Throat irritation': 114,
  'Swollen extremeties': 115,
  'Slurred speech': 116,
  'Red spots over body': 117,
  'Belly pain': 118,
  'Receiving blood transfusion': 119,
  'Acute liver failure': 120,
  'Redness of eyes': 121,
  'Rusty sputum': 122,
  'Abnormal menstruation': 123,
  'Receiving unsterile injections': 124,
  'Coma': 125,
  'Sinus pressure': 126,
  'Palpitations': 127,
  'Stomach bleeding': 128,
  'Runny nose': 129,
  'Congestion': 130,
  'Blood in sputum': 131,
  'Loss of smell': 132
};

const labelToDisease = {
  1: 'Fungal infection',
  2: 'Allergy',
  3: 'GERD',
  4: 'Chronic cholestasis',
  5: 'Drug Reaction',
  6: 'Peptic ulcer diseae',
  7: 'AIDS',
  8: 'Diabetes ',
  9: 'Gastroenteritis',
  10: 'Bronchial Asthma',
  11: 'Hypertension ',
  12: 'Migraine',
  13: 'Cervical spondylosis',
  14: 'Paralysis (brain hemorrhage)',
  15: 'Jaundice',
  16: 'Malaria',
  17: 'Chicken pox',
  18: 'Dengue',
  19: 'Typhoid',
  20: 'hepatitis A',
  21: 'Hepatitis B',
  22: 'Hepatitis C',
  23: 'Hepatitis D',
  24: 'Hepatitis E',
  25: 'Alcoholic hepatitis',
  26: 'Tuberculosis',
  27: 'Common Cold',
  28: 'Pneumonia',
  29: 'Dimorphic hemmorhoids(piles)',
  30: 'Heart attack',
  31: 'Varicose veins',
  32: 'Hypothyroidism',
  33: 'Hyperthyroidism',
  34: 'Hypoglycemia',
  35: 'Osteoarthristis',
  36: 'Arthritis',
  37: '(vertigo) Paroymsal  Positional Vertigo',
  38: 'Acne',
  39: 'Urinary tract infection',
  40: 'Psoriasis',
  41: 'Impetigo',
  0: 'nan'
};
