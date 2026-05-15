/*
 * This source code was "borrowed" from the Godot documentation.
 * © Copyright 2014-2026, Juan Linietsky, Ariel Manzur and the Godot community (CC-BY 3.0)
 *
*/

#ifndef GODOT_CPP_TEMPLATE_TRAFFIC_LIGHT_H
#define GODOT_CPP_TEMPLATE_TRAFFIC_LIGHT_H
#pragma once

#include<godot_cpp//classes/control.hpp>
#include<godot_cpp/classes/texture_rect.hpp>
#include<godot_cpp/classes/texture2d.hpp>

using namespace godot;

/**
 * TrafficLightType enumerator
 * the traffic light enumerator is used to track the current state of the light (Go,Caution,Stop)
 */
enum TrafficLightType
{
    TRAFFIC_LIGHT_GO, /**< Represents a light indicating Go*/
    TRAFFIC_LIGHT_CAUTION, /**< Represents a light indicating Caution*/
    TRAFFIC_LIGHT_STOP /**< Represents a light indicating Stop*/
};

/**
 * @class TrafficLight
 * @brief A classic code example for a GDExtension from Godotcon 2024
 *
 * The class must inherit from a Godot built in class (like Object, Node, Sprite2D, or Resource).
 * Godot does not support multiple inheritance for GDExtension classes.
 *
 */
class TrafficLight : public godot::Control
{
    GDCLASS(TrafficLight, Control);

    TextureRect *texture_rect;

    Ref<Texture2D> go_texture; /**< The Texture2D used for displaying the TrafficLight's Go state */
    Ref<Texture2D> stop_texture;/**< The Texture2D used for displaying the TrafficLight's Stop state */
    Ref<Texture2D> caution_texture;/**< The Texture2D used for displaying the TrafficLight's Caution state */

    TrafficLightType light_type;/**< The state of the TrafficLight (Go,Caution,Stop) */

protected:
	/**
	 * You must declare a protected static void _bind_methods() function in your class header.
	 */
    static void _bind_methods();
	/**
	 * Primary method used to handle engine-level callbacks, such as an object's life cycle events or node status changes
	 * @param p_what the notification value from the Godot engine some common ones are READY,PROCESS,ENTER_TREE, and EXIT_TREE
	 */
	void _notification(int p_what);

public:
	/**
	 * @brief constructor
	 *
	 *  Create a new instance of the TrafficLight class
	 */
    TrafficLight();

	/**
	 * Sets the Texture2D to be used when the light is in a Go state
	 * @param p_texture the texture to be used
	 */
	void set_go_texture(const Ref<Texture2D> &p_texture);

	/**
	 * Gets the Texture2D that acts as the texture for the Go state
	 * @return the current Texture2D being used to represent Go
	 */
	Ref<Texture2D> get_go_texture() const;

	/**
	 * Sets the Texture2D to be used when the light is in a Caution state
	 * @param p_texture the texture to be used
	 */
    void set_caution_texture(const Ref<Texture2D> &p_texture);

	/**
	 * Gets the Texture2D that acts as the texture for the Caution state
	 * @return the current Texture2D being used to represent Caution
	 */
	Ref<Texture2D> get_caution_texture() const;

	/**
	 * Sets the Texture2D to be used when the light is in a Stop state
	 * @param p_texture the texture to be used
	 */
    void set_stop_texture(const Ref<Texture2D> &p_texture);

	/**
	 * Gets the Texture2D that acts as the texture for the Stop state
	 * @return the current Texture2D being used to represent Stop
	 */
	Ref<Texture2D> get_stop_texture() const;

	/**
     *  Sets the current state of the light, go, caution, stop
     * @param p_light_type the traffic light type enumerator
     */
	void set_light_type(TrafficLightType p_light_type);

	/**
	 *  Gets the current state of the traffic light, (go,caution,stop)
	 * @return the traffic light type enumerator for the current light state(go,caution,stop)
	 */
	TrafficLightType get_light_type() const;
};

VARIANT_ENUM_CAST(TrafficLightType);
#endif //GODOT_CPP_TEMPLATE_TRAFFIC_LIGHT_H