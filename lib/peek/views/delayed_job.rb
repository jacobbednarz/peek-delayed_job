module Peek
  module Views
    class DelayedJob < View
      def initialize(options = {})
      end

      def queued_count
        Delayed::Job.count
      end

      def failure_count
        Delayed::Job.where.not(failed_at: nil).count
      end

      def context
        {
          jobs: {
            failed: self.failure_count
          }
        }
      end

      def results
        {
          queued: self.queued_count,
          failed: self.failure_count
        }
      end
    end
  end
end
