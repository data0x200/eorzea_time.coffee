class @EorzeaTime
  MONTH_PER_YEAR = 12
  DATES_PER_MONTH = 32
  HOURS_PER_DATE = 24
  MINUTES_PER_HOUR = 60
  SECONDS_PER_MINUTE = 60
  DAYS_OF_THE_WEEK = ["wind", "lightning", "fire", "earth", "ice", "water", "star", "spirit"]

  EORZEA_PER_LOCAL = 1440 / 70

  constructor: ->
    @update()

  update: ->
    localDate = new Date()
    @localUnixTime = localDate.getTime()

  unix_time: ->
    @localUnixTime * EORZEA_PER_LOCAL

  month: ->
    milliseconds_per_month = 1000 * SECONDS_PER_MINUTE * MINUTES_PER_HOUR * HOURS_PER_DATE * DATES_PER_MONTH
    1 + Math.floor((@unix_time() / milliseconds_per_month) % MONTH_PER_YEAR)

  day: ->
    milliseconds_per_day = 1000 * SECONDS_PER_MINUTE * MINUTES_PER_HOUR * HOURS_PER_DATE
    1 + Math.floor((@unix_time() / milliseconds_per_day) % DATES_PER_MONTH)

  hour: ->
    milliseconds_per_hour = 1000 * SECONDS_PER_MINUTE * MINUTES_PER_HOUR
    Math.floor((@unix_time() / milliseconds_per_hour) % HOURS_PER_DATE)

  minute: ->
    milliseconds_per_minute = 1000 * SECONDS_PER_MINUTE
    Math.floor((@unix_time() / milliseconds_per_minute) % MINUTES_PER_HOUR)

  day_of_the_week: ->
    console.log(@day())
    DAYS_OF_THE_WEEK[32 % @day()]

  update_interval: ->
    1000 / EORZEA_PER_LOCAL * SECONDS_PER_MINUTE
