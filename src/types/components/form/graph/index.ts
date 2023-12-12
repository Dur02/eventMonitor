export interface graphConfigFormInitialValueType {
  sqldate: [number, number] | null,
  weightBasis: number,
  statisticsBasis: number,
  counts: string,
  countsIsBig: number,
  themes: string,
  themesIsBig: number,
  locations: string,
  locationsIsBig: number,
  persons: string,
  personsIsBig: number,
  organizations: string,
  organizationsIsBig: number,
  websiteRegion: Array<string> | null,
  cameoeventids: string
}