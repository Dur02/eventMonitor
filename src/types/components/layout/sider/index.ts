export interface routeType {
  key: string,
  label: string | null,
  icon: Function | null,
  children: routeType[] | undefined
}