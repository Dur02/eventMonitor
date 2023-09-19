#!/usr/bin/python
# vim: set fileencoding=<encoding name> : 例如，可添加# vim: set fileencoding=utf-8 :
from os import path
from PIL import Image
import numpy as np
import operator
import sys
import matplotlib.pyplot as plt
import base64
import json
from word_cloud import WordCloud,STOPWORDS
#!领导人名称
leader="Xi Jinping"
#数据
d1="/data/leaderImagePythonTest/tem/headWordCloud"
theme= open(path.join(d1, 'theme4319.txt')).read()
organization = open(path.join(d1, 'organization4319.txt')).read()
location = open(path.join(d1, 'location4319.txt')).read()
person = open(path.join(d1, 'person4319.txt')).read()

theme1=base64.b64decode(theme)
theme2 = json.loads(theme1)
organization1=base64.b64decode(organization)
organization2 = json.loads(organization1)
person1=base64.b64decode(person)
person2=json.loads(person1)
location1=base64.b64decode(location)
location2 =json.loads(location1)
sorted_theme = sorted(theme2.iteritems(), key=operator.itemgetter(1), reverse=True)
sorted_organization = sorted(organization2.iteritems(), key=operator.itemgetter(1), reverse=True)
sorted_location = sorted(location2.iteritems(), key=operator.itemgetter(1), reverse=True)
sorted_person = sorted(person2.iteritems(), key=operator.itemgetter(1), reverse=True)
result = list(set(sorted_theme+sorted_person+sorted_organization+sorted_location))
print result
text = result
#领导人原始图像照片的路径
d3="/data/leaderImagePythonTest/eventmonitor/imageData/leaderImage"
leader = leader
leader_img_name = leader+".jpg"
alice_mask = np.array(Image.open(path.join(d3, leader_img_name)))
print alice_mask.shape[0]
#依赖的画图工具路径
d4="/data/leaderImagePythonTest/eventmonitor/python"
wc = WordCloud(background_color="white",font_path=path.join(d4, "DroidSansMono.ttf"),img_path=path.join(d3, leader_img_name), max_words=2000, mask=alice_mask,scale=1,
                   stopwords=STOPWORDS.add(""))
wc.generate(text)
#生成结果照片的目录
d2="/data/leaderImagePythonTest/eventmonitor/imageData/leaderImageResult"
wc.to_file(path.join(d2, leader+"_wordcloud.jpg"))
# show
# plt.imshow(wc, interpolation='bilinear')
# plt.axis("off")
# plt.figure()
# plt.imshow(alice_mask, cmap=plt.cm.gray, interpolation='bilinear')
# plt.axis("off")
# plt.show()
# plt.imshow(wc, interpolation='bilinear')
# plt.axis("off")
# plt.figure()
# plt.imshow(alice_mask, cmap=plt.cm.gray, interpolation='bilinear')
# plt.axis("off")
# plt.show()
