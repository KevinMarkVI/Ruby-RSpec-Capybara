require "spec_helper"

describe 'Applitools' , :type=>:feature, :js=>true do
    let(:eyes) do
        Applitools::Eyes.new
    end
    describe 'Test Web Page' do
        it 'should navigate from the main page to the features page' do
            # This is your api key, make sure you use it in all your tests.
            eyes.api_key = "#{ENV['APPLITOOLS_ACCESS_KEY']}"
            # Start visual testing with browser viewport set to 1024x742.
            eyes.test(app_name: 'Applitools', test_name: 'Test Web Page',
                      viewport_size: {width: 1020, height: 670}, driver: page.driver.browser) do
                visit 'http://www.applitools.com'
                # Visual validation point #1
                eyes.check_window('Main Page')
                page.first('.features>a').click
                # Visual validation point #2
                eyes.check_window('Features Page')
            end
        end
    end
end