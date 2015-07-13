require 'spec_helper'

module AnyAdvisor
  describe Configuration do
    describe '#export_image_width' do
      it 'defaults to 500' do
        Configuration.new.export_image_width = 500
      end
    end

    describe '#export_image_width=' do
      it 'can set a value' do
        config = Configuration.new
        config.export_image_width = 500
        expect(config.export_image_width).to eq(500)
      end
    end

    describe '#text_box_width' do
      it 'defaults to 350' do
        Configuration.new.text_box_width = 350
      end
    end

    describe '#text_box_width=' do
      it 'can set a value' do
        config = Configuration.new
        config.text_box_width = 350
        expect(config.text_box_width).to eq(350)
      end
    end

    describe '#default_image_url' do
      it 'defaults to nil' do
        Configuration.new.default_image_url = nil
      end
    end

    describe '#default_image_url=' do
      it 'can set a value' do
        config = Configuration.new
        config.default_image_url = 'https://www.google.gr/images/srpr/logo11w.png'
        expect(config.default_image_url).to eq('https://www.google.gr/images/srpr/logo11w.png')
      end
    end

    describe '#point_size' do
      it 'defaults to 50' do
        Configuration.new.point_size = 50
      end
    end

    describe '#point_size=' do
      it 'can set a value' do
        config = Configuration.new
        config.point_size = 50
        expect(config.point_size).to eq(50)
      end
    end

    describe '#font_color' do
      it 'defaults to white' do
        Configuration.new.font_color = '#fff'
      end
    end

    describe '#font_color=' do
      it 'can set a value' do
        config = Configuration.new
        config.font_color = '#fff'
        expect(config.font_color).to eq('#fff')
      end
    end

    describe '#export_image_path' do
      it 'defaults to a path' do
        Configuration.new.export_image_path = './any_advisor.jpg'
      end
    end

    describe '#export_image_path=' do
      it 'can set a value' do
        config = Configuration.new
        config.export_image_path = './any_advise.jpg'
        expect(config.export_image_path).to eq('./any_advise.jpg')
      end
    end

    describe '#truncation_limit' do
      it 'defaults to 20' do
        Configuration.new.truncation_limit = 20
      end
    end

    describe '#truncation_limit=' do
      it 'can set a value' do
        config = Configuration.new
        config.truncation_limit = 20
        expect(config.truncation_limit).to eq(20)
      end
    end

    describe '#font_family' do
      it 'defaults to Times' do
        Configuration.new.font_family = 'Times'
      end
    end

    describe '#font_family=' do
      it 'can set a value' do
        config = Configuration.new
        config.font_family = 'Times'
        expect(config.font_family).to eq('Times')
      end
    end

    describe '#aws_region' do
      it 'defaults to us-east-1' do
        Configuration.new.aws_region = 'us-east-1'
      end
    end

    describe '#aws_region=' do
      it 'can set a value' do
        config = Configuration.new
        config.aws_region = 'us-east-1'
        expect(config.aws_region).to eq('us-east-1')
      end
    end

    describe '#aws_akid' do
      it 'defaults to 12345678' do
        Configuration.new.aws_akid = '12345678'
      end
    end

    describe '#aws_akid=' do
      it 'can set a value' do
        config = Configuration.new
        config.aws_akid = '12345678'
        expect(config.aws_akid).to eq('12345678')
      end
    end

    describe '#aws_secret' do
      it 'defaults to 12345678' do
        Configuration.new.aws_secret = '12345678'
      end
    end

    describe '#aws_secret=' do
      it 'can set a value' do
        config = Configuration.new
        config.aws_secret = '12345678'
        expect(config.aws_secret).to eq('12345678')
      end
    end

    describe '#aws_bucket' do
      it 'defaults to anyadvisor' do
        Configuration.new.aws_bucket= 'anyadvisor'
      end
    end

    describe '#aws_bucket=' do
      it 'can set a value' do
        config = Configuration.new
        config.aws_bucket= 'anyadvisor'
        expect(config.aws_bucket).to eq('anyadvisor')
      end
    end

  end
end
