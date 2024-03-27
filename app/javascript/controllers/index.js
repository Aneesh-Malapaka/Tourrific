import { Application } from "stimulus"
import Carousel from "stimulus-carousel"
​import 'swiper/swiper-bundle.min.css'

const application = Application.start()
application.register("carousel", Carousel)