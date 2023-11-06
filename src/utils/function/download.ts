import type { AxiosResponse } from 'axios'

export const download = (res: AxiosResponse) => {
  /**
   * blob下载思路
   * 1） 使用ajax发起请求，指定接收类型为blob（responseType: 'blob'）
   * 2）读取请求返回的头部信息里的content-disposition，返回的文件名就在这里面（或者自定义文件名，可跳过此步骤）
   * 3）使用URL.createObjectURL将请求的blob数据转为可下载的url地址
   * 4）使用a标签下载
   *
   */
  let blob = res.data

  // 从response的headers中获取filename, 后端response.setHeader("Content-disposition", "attachment; filename=xxxx.docx") 设置的文件名;
  let patt: RegExp = new RegExp('filename=([^;]+\\.[^\\.;]+);*')
  let contentDisposition: string = decodeURI(res.headers['content-disposition'])
  let result: RegExpExecArray | null = patt.exec(contentDisposition)
  let fileName: string | undefined = result?.[1]

  // 将请求的blob数据转为可下载的url地址
  let url = URL.createObjectURL(blob)

  // 创建一个下载标签<a>
  const aLink = document.createElement('a')
  aLink.href = url

  // 2.直接使用自定义文件名,设置下载文件名称
  aLink.setAttribute('download', fileName! )
  document.body.appendChild(aLink)

  // 模拟点击下载
  aLink.click()

  // 移除改下载标签
  document.body.removeChild(aLink)
}