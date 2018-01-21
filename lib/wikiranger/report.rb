module Wikiranger
  class Report
    def initialize(contributions)
      @contributions = contributions.sort_by { |c| c.timestamp_object }.reverse
      @contributors  = contributions.map(&:user).uniq.sort_by { |ip| ip.split(".").map(&:to_i) }
      @pages         = contributions.map { |c| [c.pageid, c.title] }.uniq.sort_by { |p| p.last }
      @contribs_per_contributor = @contributors.map do |c|
        [c, contributions.count { |contrib| contrib.user == c }]
      end.to_h
      @contribs_per_page = @pages.map do |p|
        [p.first, contributions.count { |contrib| contrib.pageid == p.first }]
      end.to_h
    end

    def generate(destination)
      report = load_template
      b      = binding
      File.open(destination, "w") do |f|
        f.write(report.result(b))
      end
    end

    private

    def load_template
      ERB.new(File.read(File.join(Wikiranger::WIKIRANGER_ROOT, "templates", "default.html.erb")))
    end

    def h(unsafe)
      CGI.escapeHTML(unsafe.to_s)
    end

    def contributor_url(contribution)
      "https://en.m.wikipedia.org/wiki/Special:Contributions/#{h(contribution.user)}"
    end

    def contribution_url(contribution)
      "https://en.m.wikipedia.org/wiki/Special:MobileDiff/#{h(contribution.revid)}"
    end

    def page_url(contribution)
      "https://en.wikipedia.org/?curid=#{h(contribution.pageid)}"
    end
  end
end