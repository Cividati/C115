import paho.mqtt.client as paho
import config as cfg

client = paho.Client('coffe-machine')
client.on_connect=cfg.on_connect
client.on_message=cfg.on_message

client.connect(cfg.BROKER_URL, cfg.BROKER_PORT)
client.subscribe(cfg.BROKER_TOPIC)
client.loop_forever()
