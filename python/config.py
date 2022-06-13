BROKER_URL='localhost'
BROKER_PORT=1753
BROKER_TOPIC='topico'

def on_message(client, userdata, message):
    received_message = str(message.payload.decode("utf-8"))
    client_id = client._client_id.decode("utf-8")
    print(f"{client_id}: " ,received_message)

def on_publish(client, userdata, result):             #create function for callback
    print(f"data published! \n")
    pass

def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print(f'{client._client_id.decode("utf-8")} Connected to MQTT Broker!')
    else:
        print('Failed to connect, return code %d\n', rc)