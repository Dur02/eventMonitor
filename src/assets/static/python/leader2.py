#!/usr/bin/python
from os import path
from PIL import Image
import numpy as np
import operator
import sys
import matplotlib.pyplot as plt
import base64
import json
from wordcloud import WordCloud,STOPWORDS
leader= sys.argv[1]
id= sys.argv[2]

d1=sys.argv[3]
theme= open(path.join(d1, 'theme.txt')).read()
organization = open(path.join(d1, 'organization.txt')).read()
location = open(path.join(d1, 'location.txt')).read()
person = open(path.join(d1, 'person.txt')).read()

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
#d = path.dirname(__file__)
#leader="Xi Jinping"
 #Read the whole text.
#text = open(path.join(d, 'alice.txt')).read()
text = result
#text = [(u'ee3', 523), (u'aa', 123), (u'bb3', 223), (u'ee2', 523), (u'dd', 423), (u'cc2', 323), (u'ee', 523), (u'bb2', 223), (u'bb', 223), (u'cc', 323), (u'aa3', 123), (u'bb1', 223), (u'ee1', 523), (u'dd3', 423), (u'cc3', 323), (u'aa2', 123), (u'aa1', 123), (u'dd1', 423), (u'cc1', 323), (u'dd2', 423)]
# read the mask image
# taken from
# http://www.stencilry.org/stencils/movies/alice%20in%20wonderland/255fk.jpg
#text=result
d3=sys.argv[5]
leader = leader
leader_img_name = leader+".jpg"
alice_mask = np.array(Image.open(path.join(d3, leader_img_name)))

#stopwords = set(STOPWORDS)
#stopwords.add("said")
d4=sys.argv[6]
wc = WordCloud(background_color="white",font_path=path.join(d4, "DroidSansMono.ttf"),
                max_words=2000, mask=alice_mask,
               stopwords=STOPWORDS.add("said"),scale=1)
# generate word cloud
wc.fit_words(dict(text))
#wc.generate(text)

# store to file
d2=sys.argv[4]
wc.to_file(path.join(d2, leader+id+"_wordcloud.jpg"))

# show
#plt.imshow(wc, interpolation='bilinear')
#plt.axis("off")
#plt.figure()
#plt.imshow(alice_mask, cmap=plt.cm.gray, interpolation='bilinear')
#plt.axis("off")
#plt.show()
#plt.imshow(wc, interpolation='bilinear')
#plt.axis("off")
#plt.figure()
#plt.imshow(alice_mask, cmap=plt.cm.gray, interpolation='bilinear')
#plt.axis("off")
#plt.show()
