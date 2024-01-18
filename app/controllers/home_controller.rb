class HomeController < ApplicationController
  def index
    @description = 'Playback is an "album tribute" band. We cover classic albums in their entirety, ' \
                   "then round out our sets with some of the artist's greatest hits. So far our repertoire " \
                   "includes Bob Dylan's Blonde on Blonde, David Bowie's Aladdin Sane and Talking Heads’ Stop Making Sense."
    @sub_title = 'Classic albums | Played live | Dublin | Ireland'
    @title = "#{BAND_NAME} | #{@sub_title}"
    @canonical_url = 'https://playbackireland.com'
    @events = [
      {
        type: 'MusicEvent',
        startDate: DateTime.new(2018, 11, 24, 21, 0, 0).iso8601,
        url: 'https://www.facebook.com/events/219999265357866/',
        location: {
          type: 'Place',
          name: 'The Grand Social',
          address: {
            type: 'PostalAddress',
            name: 'Dublin, Ireland'
          },
        },
        offers: {
          type: 'Offer',
          name: 'Tickets',
          url: 'https://www.ticketmaster.ie/event/1800550F9A2A1F9A',
        }
      },
      {
        type: 'MusicEvent',
        startDate: DateTime.new(2019, 9, 18, 21, 0, 0).iso8601,
        url: 'https://www.facebook.com/events/219999265357866/',
        location: {
          type: 'Place',
          name: 'Button Factory',
          address: {
            type: 'PostalAddress',
            name: 'Dublin, Ireland'
          },
        },
        offers: {
          type: 'Offer',
          name: 'Tickets',
          url: 'https://www.ticketmaster.ie/event/1800550F9A2A1F9A'
        }
      },
      {
        type: 'MusicEvent',
        startDate: DateTime.new(2018, 10, 3, 21, 0, 0).iso8601,
        url: 'https://www.facebook.com/events/219999265357866/',
        location: {
          type: 'Place',
          name: 'WHALE THEATER',
          address: {
            type: 'PostalAddress',
            name: 'Wicklow, Ireland'
            }
        },
        offers: {
          type: 'Offer',
          name: 'Tickets',
          url: 'https://www.ticketmaster.ie/event/1800550F9A2A1F9A'
        }
      }
    ]
  end
end
