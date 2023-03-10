import json
import argparse
import tensorflow as tf
import numpy as np
import os
from keras_yolov2.frontend import YOLO


argparser = argparse.ArgumentParser(
  description='Predict tflite model in real time or with movies / images')

argparser.add_argument(
  '-c',
  '--conf',
  default='/home/lucien/Documents/project_ornithoScope_lucienbis/src/config/benchmark_config/model_classic.json',
  type=str,
  help='Path to configuration file')

argparser.add_argument(
  '-w',
  '--weights',
  default='/home/lucien/Documents/project_ornithoScope_lucienbis/src/data/saved_weights/benchmark_weights/model_classic_bestLoss.h5',
  type=str,
  help='Path to pretrained weights')

argparser.add_argument(
  '-l',
  '--lite',
  default='/home/lucien/Documents/project_ornithoScope_lucienbis/src/tf_lite/tf_lite.csv',
  type=str,
  help='Path to tflite model')


def _main_(args):
    config_path = args.conf
    weights_path = args.weights
    lite_path = args.lite

    # Load config file
    with open(config_path) as config_buffer:
        config = json.load(config_buffer)
    
    # Set weights path
    if weights_path == '':
        weights_path = config['train']['pretrained_weights']
    #creat folder for the csv
    try:
      os.mkdir("/home/lucien/Documents/project_ornithoScope_lucienbis/src/tf_lite")
    except:
      pass
      
    # Create model
    yolo = YOLO(backend=config['model']['backend'],
                input_size=(config['model']['input_size_h'], config['model']['input_size_w']),
                labels=config['model']['labels'],
                anchors=config['model']['anchors'],
                gray_mode=config['model']['gray_mode'])

    # Load weights
    yolo.load_weights(weights_path)
    
    # Convert the model
    converter = tf.lite.TFLiteConverter.from_keras_model(yolo._model)
    converter.optimizations = [tf.lite.Optimize.DEFAULT]
    converter.target_spec.supported_types = [tf.float16]
    tflite_model = converter.convert()

    # Save the model
    with open(lite_path, 'wb') as f:
        f.write(tflite_model)

if __name__ == '__main__':
    _args = argparser.parse_args()
    _main_(_args)