module Wikiranger
  class Wikipedia
    class UserContribution < OpenStruct

      PAGE_BASE_URL = "https://en.wikipedia.org/?curid=".freeze

      def page_url
        PAGE_BASE_URL + self.pageid.to_s
      end

      def timestamp_object
        @timestamp_object ||= DateTime.parse(self.timestamp)
      end

      def to_csv_array
        [self.user, self.pageid, self.revid, self.parentid, self.title, self.timestamp, self.comment, self.size]
      end
    end
  end
end