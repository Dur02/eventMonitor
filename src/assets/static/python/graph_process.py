#!/usr/bin/python
# -*- coding:utf-8 -*-

import os
from os import path
from PIL import Image
import numpy as np
from word_cloud import WordCloud,STOPWORDS


def graph_head_wordcloud(data):
    d = path.dirname(__file__)+"\\"

    print d
    leader = 'Xi Jinping'
    leader_img_name = leader+".jpg"###
    leader_mask = np.array(Image.open(path.join(d, leader_img_name)))
    wc = WordCloud(background_color="white",font_path=path.join(d, "DroidSansMono.ttf"),img_path=path.join(d, leader_img_name), max_words=2000, mask=leader_mask,scale=1,
                   stopwords=STOPWORDS.add(""))

    wc.generate(data)
    print d + leader + "_wordcloud.jpg"
    wc.to_file(d + leader + "_wordcloud.jpg")



if __name__ == '__main__':








    text = [(u'ee3', 523), (u'aa', 123), (u'bb3', 223), (u'ee2', 523), (u'dd', 423), (u'cc2', 323), (u'ee', 523), (u'bb2', 223), (u'bb', 223), (u'cc', 323), (u'aa3', 123), (u'bb1', 223), (u'ee1', 523), (u'dd3', 423), (u'cc3', 323), (u'aa2', 123), (u'aa1', 123), (u'dd1', 423), (u'cc1', 323), (u'dd2', 423)]

    graph_head_wordcloud(text)