export const getMinValue = (min: number | null, max: number | null): number | null => {
  if (min && max) {
    return min <= max ? min : max
  }
  return null
}

export const getMaxValue = (min: number | null, max: number | null): number | null => {
  if (min && max) {
    return max > min ? max : min
  }
  return null
}