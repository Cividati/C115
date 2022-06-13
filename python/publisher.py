import paho.mqtt.client as paho
import config as cfg

client1= paho.Client("control1")                           #create client object
client1.on_publish = cfg.on_publish                          #assign function to callback
client1.connect(cfg.BROKER_URL,cfg.BROKER_PORT)                                 #establish connection
ret = client1.publish(cfg.BROKER_TOPIC,"on")     