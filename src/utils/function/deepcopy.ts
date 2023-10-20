// 使用for...in 进行数据的深拷贝
const deepCopy = <T>(object: T): T | string | null => {
  let result: any
  if (Object.prototype.toString.call(object) == "[object Object]") {
    result = {}
  } else if (Object.prototype.toString.call(object) == "[object Array]") {
    result = []
  } else {
    return object
  }
  // 遍历空对象或者是空数组  也就是要拷贝的对象
  for (let key in object) {
    if (typeof object[key] == "object") {
      result[key] = deepCopy(object[key]);
    } else {
      result[key] = object[key];
    }
  }
  return result;
}

export default deepCopy