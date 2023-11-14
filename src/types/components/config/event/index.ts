export interface searchFormType {
  configName: string ,
  configType: string | null,
  runStatus: number | null,
  createByName: string
}

export interface eventConfigSettingInitialValueType {
  configName: string,
  configType: string[] | null,
  remark: string | null,
  orderPriority: number | null,
  purview: number | null,
  isMonitor: number | null
}

export interface eventConfigFormInitialValueType {
  sqldate: [number, number] | null,
  dataSource: string,
  weightBasis: number,
  statisticsBasis: number,
  actor1countrycode: Array<string> | null,
  actor1knowngroupcode: Array<string> | null,
  actor1religion1code: Array<string> | null,
  actor1religion2code: Array<string> | null,
  actor1ethniccode: Array<string> | null,
  actor1type1code: Array<string> | null,
  actor1type2code: Array<string> | null,
  actor1type3code: Array<string> | null,
  actor1name: string | null,
  actor1nameIsBig: number,
  actor1geoType: Array<string> | null,
  actor1geoCountrycodeAndAdm1code: Array<string> | null,
  actor1geoFullname: string | null,
  actor1geoFullnameIsBig: number,
  actor2countrycode: Array<string> | null,
  actor2knowngroupcode: Array<string> | null,
  actor2religion1code: Array<string> | null,
  actor2religion2code: Array<string> | null,
  actor2ethniccode: Array<string> | null,
  actor2type1code: Array<string> | null,
  actor2type2code: Array<string> | null,
  actor2type3code: Array<string> | null,
  actor2name: string | null,
  actor2nameIsBig: number,
  actor2geoType: Array<string> | null,
  actor2geoCountrycodeAndAdm1code: Array<string> | null,
  actor2geoFullname: string | null,
  actor2geoFullnameIsBig: number,
  quadclass: Array<string> | null,
  eventrootcode: Array<string> | null,
  eventbasecode: Array<string> | null,
  eventcode: Array<string> | null,
  actiongeoType: Array<string> | null,
  actiongeoCountrycodeAndAdm1code: Array<string> | null,
  actiongeoFullname: string | null,
  actiongeoFullnameIsBig: number,
  sourceUrl: string | null,
  beginAvgtone: number | null,
  endAvgtone: number | null,
  // avgtone: Array<number | null>,
  beginGoldsteinscale: number | null,
  endGoldsteinscale: number | null,
  // goldsteinscale: Array<number | null>,
  isrootevent: number | null,
  numsourcesMin: number | null,
  numsourcesMax: number | null,
  nummentionsMin: number | null,
  nummentionsMax: number | null,
  numarticlesMin: number | null,
  numarticlesMax: number | null,
}

/**
 * EventConfigurationBo，事件配置管理业务对象 gt_event_configuration
 */
export interface eventConfigRowsType {
  /**
   * 事件发生地州省编码
   */
  actiongeoAdm1code: string | null,
  /**
   * 事件发生地国家编码
   */
  actiongeoCountrycode: string | null,
  /**
   * 事件地理全称
   */
  actiongeoFullname: string | null,
  /**
   * 角色2地理全称是否区分大小写:0（默认）->是，1->否
   */
  actiongeoFullnameIsBig: number,
  /**
   * 事件地理类型
   */
  actiongeoType: string | null,
  /**
   * 角色1编码
   */
  actor1code?: string,
  /**
   * 角色1所属国家编码
   */
  actor1countrycode: string | null,
  /**
   * 角色1所属种族编码
   */
  actor1ethniccode: string | null,
  /**
   * 角色1地理州省编码
   */
  actor1geoAdm1code: string | null,
  /**
   * 角色1地理国家编码
   */
  actor1geoCountrycode: string | null,
  /**
   * 角色1地理全称
   */
  actor1geoFullname: string | null,
  /**
   * 角色1地理全称是否区分大小写:0（默认）->是，1->否
   */
  actor1geoFullnameIsBig: number,
  /**
   * 角色1地理类型
   */
  actor1geoType: string | null,
  /**
   * 角色1所属组织编码
   */
  actor1knowngroupcode: string | null,
  /**
   * 角色1实名
   */
  actor1name: string | null,
  /**
   * 角色1全名是否区分大小写:0（默认）->是，1->否
   */
  actor1nameIsBig: number,
  /**
   * 角色1所属宗教编码1
   */
  actor1religion1code: string | null,
  /**
   * 角色1所属宗教编码2
   */
  actor1religion2code: string | null,
  /**
   * 角色1身份类型编码1
   */
  actor1type1code: string | null,
  /**
   * 角色1身份类型编码2
   */
  actor1type2code: string | null,
  /**
   * 角色1身份类型编码3
   */
  actor1type3code: string | null,
  /**
   * 角色2编码
   */
  actor2code?: string,
  /**
   * 角色2所属国家编码
   */
  actor2countrycode: string | null,
  /**
   * 角色2所属种族编码
   */
  actor2ethniccode: string | null,
  /**
   * 角色1地理州省编码
   */
  actor2geoAdm1code: string | null,
  /**
   * 角色2地理国家编码
   */
  actor2geoCountrycode: string | null,
  /**
   * 角色2地理全称
   */
  actor2geoFullname: string | null,
  /**
   * 角色2地理全称是否区分大小写:0（默认）->是，1->否
   */
  actor2geoFullnameIsBig: number,
  /**
   * 角色2地理类型
   */
  actor2geoType: string | null,
  /**
   * 角色2所属组织编码
   */
  actor2knowngroupcode: string | null,
  /**
   * 角色2实名
   */
  actor2name: string | null,
  /**
   * 角色2全名是否区分大小写:0（默认）->是，1->否
   */
  actor2nameIsBig: number,
  /**
   * 角色2所属宗教编码1
   */
  actor2religion1code: string | null,
  /**
   * 角色2所属宗教编码2
   */
  actor2religion2code: string | null,
  /**
   * 角色2身份类型编码1
   */
  actor2type1code: string | null,
  /**
   * 角色2身份类型编码2
   */
  actor2type2code: string | null,
  /**
   * 角色2身份类型编码3
   */
  actor2type3code: string | null,
  /**
   * 最小情感值-10
   */
  beginAvgtone: number | null,
  /**
   * 最小值影响度-100
   */
  beginGoldsteinscale: number | null,
  /**
   * 开始发生日期
   */
  beginSqldate: number,
  /**
   * 最小权重数
   */
  beginWeightCount?: number,
  /**
   * 配置名称
   */
  configName: string,
  /**
   * 配置类型
   */
  configType: string,
  /**
   * 创建者
   */
  createBy?: number,
  /**
   * 创建人名称
   */
  createByName?: string,
  /**
   * 创建部门
   */
  createDept?: number,
  /**
   * 创建时间
   */
  createTime?: Date,
  /**
   * 最大情感值10
   */
  endAvgtone: number | null,
  /**
   * 最大值影响度100
   */
  endGoldsteinscale: number | null,
  /**
   * 截止发生日期
   */
  endSqldate: number,
  /**
   * 最大权重数
   */
  endWeightCount?: number,
  /**
   * 基事件编码
   */
  eventbasecode: string | null,
  /**
   * 事件编码
   */
  eventcode: string | null,
  /**
   * 根事件编码
   */
  eventrootcode: string | null,
  /**
   * 高级搜索内容
   */
  highQuery?: string,
  /**
   * 事件配置id
   */
  id: number,
  /**
   * 是否实时监测: 1->是，0->否
   */
  isMonitor: number,
  /**
   * 是否为根事件
   */
  isrootevent: number | null,
  /**
   * 是否保存: 1->是，0->否
   */
  isSaveConfig?: number,
  /**
   * 挂起：1->显示(默认)，2->不显示
   */
  isShow: number,
  /**
   * 最大文章数
   */
  numarticlesMax: number | null,
  /**
   * 最小文章数
   */
  numarticlesMin: number | null,
  /**
   * 最大所提到次数（事件数)
   */
  nummentionsMax: number | null,
  /**
   * 最小所提到次数（事件数)
   */
  nummentionsMin: number | null,
  /**
   * 最大来源数
   */
  numsourcesMax: number | null,
  /**
   * 最小来源数
   */
  numsourcesMin: number | null,
  /**
   * 优先级：用于界面此配置的显示顺序
   */
  orderPriority: number,
  /**
   * 是否私有：1->私有, 2->公有
   */
  purview: number,
  /**
   * 事件类型
   */
  quadclass: string | null,
  /**
   * 备注
   */
  remark: string | null,
  /**
   * 配置执行查询状态：0：待执行查询,1：执行查询中, 2：执行查询完成（正常结束,3：执行查询失败（异常结束）,4:排队中
   */
  runStatus: number,
  /**
   * 源URL
   */
  sourceurl: string | null,
  /**
   * 统计依据:1->比重，2_>数量
   */
  statisticsBasis: number,
  /**
   * 更新者
   */
  updateBy?: number,
  /**
   * 更新时间
   */
  updateTime?: Date,
  /**
   * 权重依据:1事件数，2文章数、3信源数、4去重事件数
   */
  weightBasis: number,
}