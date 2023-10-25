import sys
import pickle

with open('scaler.pkl', 'rb') as s:
    scaler = pickle.load(s)

with open('model.pkl', 'rb') as m:
    model = pickle.load(m)


if len(sys.argv) > 1:

    data_points = [float(arg) for arg in sys.argv[1:]]

    if len(data_points) != 5:
        print('Debes proporcionar exactamente 5 datos para hacer una predicción.')
    else:
        
        x_normalized = scaler.transform([data_points])

        prediction = model.predict(x_normalized)

        print("Predicción:", prediction)

else:
    print('No se proporcionaron argumentos. Debes proporcionar 5 datos para hacer una predicción.')